from django.urls import path
from .views import main

app_name='mainApp'
urlpatterns = [
  path('', main, name='main'),
]