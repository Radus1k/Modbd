from django import forms
from .connector import ConnectionManager
from .models import *
import datetime

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
    id_client = forms.ModelChoiceField(queryset=Client.objects.all(), widget=forms.HiddenInput)
    id_hotel = forms.ModelChoiceField(queryset=Hotel.objects.all())
    # data_efectuarii = forms.DateField(required=False, widget=forms.DateInput(attrs={'type': 'date'}))
    data_inceput = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    data_sfarsit = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    # pret_total = forms.FloatField(required=False)
    specificatii = forms.CharField(max_length=2500, required=False, widget=forms.Textarea)

    def save(self):
        id_client = self.cleaned_data['id_client'].id_client
        id_hotel = self.cleaned_data['id_hotel'].id_hotel
        data_efectuarii = datetime.date.today().strftime('%d/%m/%Y')
        data_inceput = self.cleaned_data['data_inceput'].strftime('%d/%m/%Y')
        data_sfarsit = self.cleaned_data['data_sfarsit'].strftime('%d/%m/%Y')

        connection_manager = ConnectionManager()
        is_inserted = connection_manager.insert_reservation(id_client, id_hotel, data_efectuarii, data_inceput, data_sfarsit)
        return is_inserted

class HotelTipCameraForm(forms.Form):
    
    id_hotel = forms.ModelChoiceField(queryset=Hotel.objects.all())
    id_tip_camera = forms.ModelChoiceField(queryset=TipCamera.objects.all())
    nr_camere = forms.IntegerField(max_value=5)    
    pret_per_noapte = forms.IntegerField()      
                            
    def save(self):
        id_hotel = self.cleaned_data['id_hotel'].id_hotel
        id_tip_camera = self.cleaned_data['id_tip_camera'].id_tip_camera
        nr_camere = self.cleaned_data['nr_camere']
        pret_per_noapte = self.cleaned_data['pret_per_noapte']
        
        connection_manager = ConnectionManager()
        is_inserted = connection_manager.insert_hotel_tip_camera(id_hotel, id_tip_camera, nr_camere, pret_per_noapte)
        return is_inserted   
    
class RezervareTipCameraForm(forms.Form):
    tip_camera = forms.ModelChoiceField(queryset=TipCamera.objects.all())
    nr_camere = forms.IntegerField(max_value=5)    
    # pret_per_noapte = forms.FloatField()
    
    def save(self):
        id_tip_camera = self.cleaned_data['tip_camera'].id_tip_camera
        nr_camere = self.cleaned_data['tip_camera'].nr_camere
        # pret_per_noapte = self.cleaned_data['tip_camera'].pret_per_noapte
        
        return True
        
        # connection_manager = ConnectionManager()
        # is_inserted = connection_manager.insert_rezervare_tip_camera(id_rezervare, id_tip_camera, nr_camere, pret_per_noapte)
        # return is_inserted   