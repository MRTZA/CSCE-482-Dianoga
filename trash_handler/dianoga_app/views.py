import os
import os.path

from django.contrib import messages
from django.http import HttpResponseRedirect
from django.shortcuts import render

from .forms import UploadFileForm

from rest_framework.parsers import FileUploadParser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status

from .serializers import FileSerializer

from imageai.Prediction.Custom import CustomImagePrediction


# Create your views here.
def home(request):
    return render(request, 'dianoga_app/home.html')


def handle_uploaded_file(f):
    with open('some/file/name.txt', 'wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)


def data_collection(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            messages.success(request, 'Success - Thank You, Please Upload More!')
            return HttpResponseRedirect('data_collection')
        else:
            messages.error(request, 'Error - Please Upload an Image File')
            return HttpResponseRedirect('data_collection')
    else:
        context = {}
        form = UploadFileForm()
        context['form'] = form

        # get example images
        examples = {}
        examples_path = "example/"
        for root, dirs, files in os.walk(os.getcwd() + '/dianoga_app/static/' + examples_path):
            for filename in files:
                examples[examples_path + filename] = filename.split(".jpg")[0]
        context['examples'] = examples

        # get progress bar info
        max_data = 800
        context['max_data'] = max_data

        train_path = "../trashnet/train/"
        test_path = "../trashnet/test/"
        collection_path = "media/img/"

        materials = next(os.walk(train_path))[1]
        progress = {}

        for m in materials:
            DIR = os.path.join(train_path, m)
            train_num = len([name for name in os.listdir(DIR) if os.path.isfile(os.path.join(DIR, name))])

            DIR = os.path.join(test_path, m)
            test_num = len([name for name in os.listdir(DIR) if os.path.isfile(os.path.join(DIR, name))])

            DIR = os.path.join(collection_path, m)
            collected = len([name for name in os.listdir(DIR) if os.path.isfile(os.path.join(DIR, name))])

            progress[m] = (train_num + collected + test_num)

        context['progress'] = progress

    return render(request, 'dianoga_app/data_collection.html', context)


class FileUploadView(APIView):
    parser_class = (FileUploadParser,)

    def post(self, request, *args, **kwargs):

        file_serializer = FileSerializer(data=request.data)

        if file_serializer.is_valid():
            file_serializer.save()
            response = file_serializer.data

            # prediction
            prediction = CustomImagePrediction()
            prediction.setModelTypeAsResNet()
            prediction.setModelPath("media/model/model_terra.h5")
            prediction.setJsonPath("../trashnet/json/model_class.json")
            prediction.loadModel(num_objects=len(next(os.walk("../trashnet/train/"))[1]))

            path = os.getcwd() + response['file']
            predictions, probabilities = prediction.predictImage(path, result_count=5)
            mapped = zip(predictions, probabilities)

            response['prediction'] = mapped

            return Response(response, status=status.HTTP_201_CREATED)
        else:
            return Response(file_serializer.errors, status=status.HTTP_400_BAD_REQUEST)