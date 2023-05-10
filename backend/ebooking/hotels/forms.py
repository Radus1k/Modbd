from django import forms
from .connector import ConnectionManager

class HotelForm(forms.Form):
    nume = forms.CharField(max_length=50)
    nr_stele = forms.IntegerField()
    adresa = forms.CharField(max_length=50)
    id_localitate = forms.IntegerField()

    def save(self):
        nume = self.cleaned_data['nume']
        nr_stele = self.cleaned_data['nr_stele']
        adresa = self.cleaned_data['adresa']
        id_localitate = self.cleaned_data['id_localitate']

        connection_manager = ConnectionManager()
        is_inserted = connection_manager.insert_hotel(nume, nr_stele, adresa, id_localitate)
        return is_inserted
    
        # Perform the specific query to insert the hotel using the provided data
        