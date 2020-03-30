from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('data_collection', views.data_collection, name='data_collection'),
]