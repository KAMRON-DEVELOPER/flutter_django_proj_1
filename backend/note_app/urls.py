from .views import NotesApiView, NoteApiView
from django.urls import path

urlpatterns = [
    path('notes/', NotesApiView.as_view()),
    path('notes/<str:pk>/', NoteApiView.as_view()),
]