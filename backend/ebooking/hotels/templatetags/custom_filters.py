from django import template
from ..models import Administrator, Client

register = template.Library()

@register.filter
def is_administrator(user):
    try:
        user_client = Client.objects.get(nume_utilizator=user.username)
        if not user_client.is_administrator():
            return True
    except Administrator.DoesNotExist:
        return False