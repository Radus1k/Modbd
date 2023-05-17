from django.core.management.base import BaseCommand
from django.contrib.auth.models import User
from hotels.models import Client
from accounts.models import Profile

class Command(BaseCommand):
    help = 'Create User objects based on client table data'

    def handle(self, *args, **options):
        self.stdout.write("\n\n*********Creating users....\n\n")
        clients = Client.objects.all()

        for client in clients:
            try:
                user = User.objects.create_user(
                    username=client.nume_utilizator,
                    password="password",
                    email=client.email,
                    first_name=client.nume_complet
                    # Add other fields as needed
                )
                profile = Profile.objects.create(user=user, phone=client.telefon, is_administrator=False)
                self.stdout.write(f'Created User: {user.username}')
            except Exception as e:
                self.stdout.write(f'User already exists, User: {user.username} , error: {e}',)