from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from hotels.models import Client
from accounts.models import Profile
from django.contrib.auth.hashers import make_password

class Command(BaseCommand):
    help = 'Create User objects based on client table data'

    def handle(self, *args, **options):
        clients = Client.objects.all()
        for client in clients:
            user = User.objects.create_user(
                username=client.nume_utilizator,   
                password = make_password('password'),
                email=client.email,
                first_name=client.nume_complet
                # Add other fields as needed
            )
            profile = Profile.objects.create(user=user, phone=client.telefon, is_hotel_administrator=False)
            self.stdout.write(f'Created User: {user.username}')