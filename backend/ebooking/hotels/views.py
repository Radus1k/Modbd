from django.shortcuts import render, redirect
from django.contrib import messages
from .models import Hotel
from .forms import HotelForm, RezervareForm

# Create your views here.

def hotels_view(request):
    qs = Hotel.objects.all()
    context = {"hotels": qs}
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

def add_rezervare_view(request):
    if request.method == 'POST':
        form = RezervareForm(request.POST)
        if form.is_valid():
            is_inserted = form.save()  # Save the hotel to the database
            if is_inserted:
                messages.add_message(request, messages.SUCCESS, "Rezervare adaugata cu succes!")
            else:
                messages.add_message(request, messages.ERROR, "Eroare la adaugarea rezervarii!")
            return redirect('hotels')  # Redirect to a success page or the hotel list page
    else:
        form = RezervareForm()

    return render(request, 'add_rezervare.html', {'form': form})

