from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^data_collection', views.data_collection, name='data_collection'),
    url(r'^success', views.success, name='success'),
    url(r'^', views.home, name='home')
]