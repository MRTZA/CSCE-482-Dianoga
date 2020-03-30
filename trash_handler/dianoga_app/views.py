from django.shortcuts import render
from django.http import HttpResponse


# Create your views here.
def home(request):
    return render(request, 'dianoga_app/home.html')

def data_collection(request):
    return render(request, 'dianoga_app/data_collection.html')