from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Hotel, Rezervare, Client, Administrator
from .forms import HotelForm, RezervareForm
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseForbidden

# Create your views here.

def hotels_view(request):
    user = request.user
    user_client = None
    is_admin = False
    try:
        user_client = Client.objects.get(nume_utilizator=user.username)
        is_admin = user_client.is_administrator()
    except: 
        print("request user is porbably guest")   
    qs = Hotel.objects.all()
    context = {"hotels": qs, "is_admin": is_admin}
    return render(request,'hotels.html', context)


def add_hotel_view(request):
    if request.method == 'POST':
        form = HotelForm(request.POST)
        if form.is_valid():
            is_inserted = form.save()  # Save the hotel to the database
            if is_inserted:
                messages.add_message(request, messages.SUCCESS, "Hotel adaugat cu succes!")
            else:
                messages.add_message(request, messages.ERROR, "Eroare la adaugarea hotelului!")
            return redirect('hotels')  # Redirect to a success page or the hotel list page
    else:
        form = HotelForm()

    return render(request, 'add_hotel.html', {'form': form})

@login_required
def add_rezervare_view(request):
    user = request.user
    user_client = Client.objects.get(nume_utilizator=user.username)

    if user_client.is_administrator():
        return HttpResponseForbidden()

    if request.method == 'POST':
        form = RezervareForm(request.POST, initial={'id_client': user_client.id_client})
        if form.is_valid():
            is_inserted = form.save()  # Save the hotel to the database
            if is_inserted:
                messages.add_message(request, messages.SUCCESS, "Rezervare adaugata cu succes!")
            else:
                messages.add_message(request, messages.ERROR, "Eroare la adaugarea rezervarii!")
            return redirect('hotels')  # Redirect to a success page or the hotel list page
    else:
        form = RezervareForm(initial={'id_client': user_client.id_client})

    return render(request, 'add_rezervare.html', {'form': form})


@login_required
def reservations_view(request):
    user = request.user
    reservations = None
    user_client = Client.objects.get(nume_utilizator=user.username)
    if not user.is_authenticated:
        return HttpResponseForbidden()
    if user.is_superuser:
        reservations = Rezervare.objects.all()
    elif user_client.is_administrator():
        administrator = Administrator.objects.get(nume_utilizator=user_client.nume_utilizator)
        reservations = Rezervare.objects.filter(id_client=user_client.id_client)
        # hotels_associated = Hotel.objects.filter(hoteladministrator__id_administrator=administrator)
        # reservations = Rezervare.objects.filter(id_hotel__in=hotels_associated)
    elif user.is_authenticated and not user_client.is_administrator():
        reservations = Rezervare.objects.filter(id_client=user_client.id_client)

    # filter_obj = ReservationFilter(request.GET, queryset=reservations)
    # reservations_qs = filter_obj.qs     "filter":filter_obj
    print("we returned this :", reservations)
    context = {"reservations": reservations}
    return render(request, 'reservations.html', context)
