from django import forms
from .connector import ConnectionManager
from .models import *

class HotelForm(forms.Form):
    nume = forms.CharField(max_length=50)
    nr_stele = forms.IntegerField()
    adresa = forms.CharField(max_length=50)
    id_localitate = forms.ModelChoiceField(queryset=Localitate.objects.all(), empty_label=None)
    # id_localitate = forms.IntegerField()

    def save(self):
        nume = self.cleaned_data['nume']
        nr_stele = self.cleaned_data['nr_stele']
        adresa = self.cleaned_data['adresa']
        id_localitate = self.cleaned_data['id_localitate'].id_localitate

        connection_manager = ConnectionManager()
        is_inserted = connection_manager.insert_hotel(nume, nr_stele, adresa, id_localitate)
        return is_inserted
    
        # Perform the specific query to insert the hotel using the provided data

class RezervareForm(forms.Form):
    id_client = forms.ModelChoiceField(queryset=Client.objects.all())
    id_hotel = forms.ModelChoiceField(queryset=Hotel.objects.all())
    data_efectuarii = forms.DateField(required=False, widget=forms.DateInput(format='%d/%m/%Y', attrs={'type': 'date'}), input_formats=['%d/%m/%Y'])
    data_inceput = forms.DateField(widget=forms.DateInput(format='%d/%m/%Y', attrs={'type': 'date'}), input_formats=['%d/%m/%Y'])
    data_sfarsit = forms.DateField(widget=forms.DateInput(format='%d/%m/%Y', attrs={'type': 'date'}), input_formats=['%d/%m/%Y'])
    pret_total = forms.FloatField(required=False)
    specificatii = forms.CharField(max_length=2500, required=False, widget=forms.Textarea)

    def save(self):
        id_client = self.cleaned_data['id_client'].id_client
        id_hotel = self.cleaned_data['id_hotel'].id_hotel
        data_efectuarii = self.cleaned_data['data_efectuarii']
        data_inceput = self.cleaned_data['data_inceput']
        data_sfarsit = self.cleaned_data['data_sfarsit']

        connection_manager = ConnectionManager()
        is_inserted = connection_manager.insert_reservation(id_client, id_hotel, data_efectuarii, data_inceput, data_sfarsit)
        return is_inserted
    
    def validate():
        pass
