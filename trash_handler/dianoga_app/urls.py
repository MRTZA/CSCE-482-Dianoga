from django.conf.urls import url
from django.conf.urls.static import static
from django.conf import settings
from .views import FileUploadView
from . import views

urlpatterns = [
    url(r'^data_collection', views.data_collection, name='data_collection'),
    url(r'^predict/$', FileUploadView.as_view()),
    url(r'^', views.home, name='home'),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
