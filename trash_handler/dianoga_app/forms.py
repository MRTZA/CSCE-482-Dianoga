from django import forms
from django.forms import ModelForm
from .models import Document


class UploadFileForm(forms.ModelForm):
    class Meta:
        model = Document
        fields =('category','file',)