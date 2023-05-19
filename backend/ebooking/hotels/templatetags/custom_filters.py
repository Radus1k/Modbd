from django import template
from ..models import Administrator, Client
from django.contrib.auth.models import User

register = template.Library()

@register.filter
def is_administrator(user):
    try:
        user_client = Client.objects.get(nume_utilizator=user.username)
    except Client.DoesNotExist:
        return False
    
    if  user_client.is_administrator():
        return True
    
    return False