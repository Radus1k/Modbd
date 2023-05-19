"""
URL configuration for ebooking project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from hotels import views as hotel_views
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('hotels/', hotel_views.hotels_view, name='hotels'),
    path('', hotel_views.hotels_view, name='home'),
    path('home/', hotel_views.hotels_view, name='home'),
    path('', hotel_views.hotels_view, name='hotels'),
    path('add-hotel/', hotel_views.add_hotel_view, name='add-hotel'),
    path('add-rezervare/', hotel_views.add_rezervare_view, name='add-rezervare'),
    path('add-hotel-camera/', hotel_views.add_hotelcamera_view, name='add-camera'),
    path('reservations/', hotel_views.reservations_view, name='reservations'), 
    path('accounts/', include('accounts.urls')),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
