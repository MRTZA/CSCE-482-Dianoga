from django.http import HttpResponseRedirect
from django.shortcuts import render
from .forms import UploadFileForm


# Create your views here.
def home(request):
    return render(request, 'dianoga_app/home.html')

def handle_uploaded_file(f):
    with open('some/file/name.txt','wb+') as destination:
        for chunk in f.chunks():
            destination.write(chunk)

def data_collection(request):
    if request.method == 'POST':
        form = UploadFileForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('success')
    else:
        form = UploadFileForm()
    return render(request, 'dianoga_app/data_collection.html', {'form': form})

def success(request):
    return render(request,'dianoga_app/success.html')