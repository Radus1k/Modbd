from django.db import models
from django.contrib.auth import get_user_model
from hotels.models import HotelAdministrator

User = get_user_model()

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=30)
    is_administrator = models.BooleanField(default=False)
    id_administrator = models.ForeignKey(HotelAdministrator, models.DO_NOTHING, db_column='id_administrator')

    class Meta:
        managed = False
        db_table = 'profile'

    def __str__(self):
        return "profile: " + self.user.username

    