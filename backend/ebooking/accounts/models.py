from django.db import models
from django.contrib.auth import get_user_model
from hotels.models import HotelAdministrator

User = get_user_model()

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=30, null=True, blank=True)
    iban = models.CharField(max_length=50, null=True, blank=True)
    hash_parola = models.CharField(max_length=50, null=True, blank=True)
    class Meta:
        db_table = 'profile'

    def __str__(self):
        return "profile: " + self.user.username

    