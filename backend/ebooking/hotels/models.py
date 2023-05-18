from django.db import models

# Create your models here.
class Administrator(models.Model):
    id_administrator = models.BigIntegerField(primary_key=True)
    nume_utilizator = models.TextField(unique=True)
    hash_parola = models.TextField()
    nume_complet = models.TextField()
    telefon = models.CharField(max_length=15)
    email = models.TextField(unique=True)
    cnp = models.CharField(unique=True, max_length=13)

    class Meta:
        managed = False
        db_table = 'administrator'


class Client(models.Model):
    id_client = models.BigAutoField(primary_key=True)
    nume_utilizator = models.CharField(max_length=30)
    hash_parola = models.CharField(max_length=25)
    nume_complet = models.CharField(max_length=30)
    telefon = models.CharField(max_length=15)
    email = models.CharField(max_length=50)
    cnp = models.CharField(max_length=13, blank=True, null=True)
    iban = models.CharField(max_length=34, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'client'

    def is_administrator(self):
        try:
            administrator = Administrator.objects.get(nume_utilizator=self.nume_utilizator)
            return True
        except Administrator.DoesNotExist:
            return None

    def __str__(self) -> str:
        return self.nume_complet
        

class Facilitate(models.Model):
    id_facilitate = models.BigAutoField(primary_key=True)
    nume = models.TextField()

    class Meta:
        managed = False
        db_table = 'facilitate'


class TipCamera(models.Model):
    id_tip_camera = models.AutoField(primary_key=True)
    nr_paturi_duble = models.SmallIntegerField()
    nr_paturi_simple = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'tip_camera'
      

class Hotel(models.Model):
    id_hotel = models.IntegerField(primary_key=True)
    nume = models.CharField(max_length=50)
    nr_stele = models.IntegerField()
    adresa = models.CharField(max_length=50)
    id_localitate = models.ForeignKey('Localitate', models.DO_NOTHING, db_column='id_localitate')
     
    class Meta:
        managed = False
        db_table = 'hotel'

    def __str__(self) -> str:
        return self.nume    


class HotelAdministrator(models.Model):
    id_hotel = models.OneToOneField(Hotel, models.DO_NOTHING, db_column='id_hotel', primary_key=True)  # The composite primary key (id_hotel, id_administrator) found, that is not supported. The first column is selected.
    id_administrator = models.ForeignKey(Administrator, models.DO_NOTHING, db_column='id_administrator')

    class Meta:
        managed = False
        db_table = 'hotel_administrator'
        unique_together = (('id_hotel', 'id_administrator'),)


class HotelFacilitate(models.Model):
    id_hotel = models.OneToOneField(Hotel, models.DO_NOTHING, db_column='id_hotel', primary_key=True)  # The composite primary key (id_hotel, id_facilitate) found, that is not supported. The first column is selected.
    id_facilitate = models.ForeignKey(Facilitate, models.DO_NOTHING, db_column='id_facilitate')

    class Meta:
        managed = False
        db_table = 'hotel_facilitate'
        unique_together = (('id_hotel', 'id_facilitate'),)


class HotelTipCamera(models.Model):
    id_hotel = models.OneToOneField(Hotel, models.DO_NOTHING, db_column='id_hotel', primary_key=True)  # The composite primary key (id_hotel, id_tip_camera) found, that is not supported. The first column is selected.
    id_tip_camera = models.ForeignKey('TipCamera', models.DO_NOTHING, db_column='id_tip_camera')
    nr_camere = models.SmallIntegerField()
    pret_per_noapte = models.FloatField()

    class Meta:
        managed = False
        db_table = 'hotel_tip_camera'
        unique_together = (('id_hotel', 'id_tip_camera'),)


class Judet(models.Model):
    id_judet = models.IntegerField(primary_key=True)
    id_regiune = models.ForeignKey('Regiune', models.DO_NOTHING, db_column='id_regiune')
    nume = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'judet'


class Localitate(models.Model):
    id_localitate = models.IntegerField(primary_key=True)
    id_judet = models.ForeignKey(Judet, models.DO_NOTHING, db_column='id_judet')
    nume = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'localitate'
        
    def __str__(self) -> str:
        return self.nume


class Recenzie(models.Model):
    id_recenzie = models.IntegerField(primary_key=True)
    id_client = models.ForeignKey(Client, models.DO_NOTHING, db_column='id_client')
    id_hotel = models.ForeignKey(Hotel, models.DO_NOTHING, db_column='id_hotel')
    scor = models.SmallIntegerField()
    text_recenzie = models.CharField(max_length=2500)

    class Meta:
        managed = False
        db_table = 'recenzie'


class Regiune(models.Model):
    id_regiune = models.IntegerField(primary_key=True)
    nume = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'regiune'


class Rezervare(models.Model):
    id_rezervare = models.IntegerField(primary_key=True)
    id_client = models.ForeignKey(Client, models.DO_NOTHING, db_column='id_client')
    id_hotel = models.ForeignKey(Hotel, models.DO_NOTHING, db_column='id_hotel')
    data_efectuarii = models.DateField(blank=True, null=True)
    data_inceput = models.DateField()
    data_sfarsit = models.DateField()
    pret_total = models.FloatField(blank=True, null=True)
    specificatii = models.CharField(max_length=2500, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rezervare'


class RezervareTipCamera(models.Model):
    id_rezervare = models.OneToOneField(Rezervare, models.DO_NOTHING, db_column='id_rezervare', primary_key=True)  # The composite primary key (id_rezervare, id_tip_camera) found, that is not supported. The first column is selected.
    id_tip_camera = models.ForeignKey('TipCamera', models.DO_NOTHING, db_column='id_tip_camera')
    nr_camere = models.SmallIntegerField()
    pret_per_noapte = models.FloatField()

    class Meta:
        managed = False
        db_table = 'rezervare_tip_camera'
        unique_together = (('id_rezervare', 'id_tip_camera'),)
