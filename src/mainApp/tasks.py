from celery import shared_task
from django.shortcuts import render

@shared_task
def add_num(x, y):
  return x + y