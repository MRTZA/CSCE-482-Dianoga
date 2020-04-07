import os
from django.db import models

# Create your models here.
DOCUMENT_CHOICES = (
    ('debug','Debug'),
    ('trash','Trash'),
    ('paper','Paper'),
    ('plastic','Plastic'),
    ('metal','Metal'),
    ('cardboard','Cardboard'),
    ('glass','Glass'),
)

def get_upload_to(instance,filename):
    path=os.path.join("img",instance.category,filename)
    return path

class Document(models.Model):
    category = models.CharField(max_length=10,choices=DOCUMENT_CHOICES,default='Debug')
    file = models.ImageField(upload_to=get_upload_to)