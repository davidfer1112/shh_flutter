import 'package:flutter/material.dart';
import 'package:app/models/room_data.dart';
import 'package:app/utils/localfiles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HotelListData {
  String imagePath;
  String titleTxt;
  String subTxt;
  DateText? date;
  String dateTxt;
  String roomSizeTxt;
  RoomData? roomData;
  double dist;
  double rating;
  int reviews;
  int perNight;
  bool isSelected;
  PeopleSleeps? peopleSleeps;
  LatLng? location;
  Offset? screenMapPin; // we used this screen Offset for adding on Map layer

  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dateTxt = "",
    this.roomSizeTxt = "",
    this.roomData,
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.perNight = 180,
    this.isSelected = false,
    this.date,
    this.peopleSleeps,
    this.location,
    this.screenMapPin,
  });

  // we need location in this hotelList bcz we using that in map
  static List<HotelListData> hotelList = [
    HotelListData(
      imagePath: Localfiles.hotel_1,
      titleTxt: 'Apartaestudio',
      subTxt: 'Bogotá',
      dist: 0.2,
      reviews: 80,
      rating: 4.7,
      perNight: 55000,
      roomData: RoomData(1, 2),
      isSelected: true,
      date: DateText(1, 5),
      location: LatLng(51.516898, -0.143377),
    ),
    HotelListData(
      imagePath: Localfiles.hotel_2,
      titleTxt: 'Apartaestudio',
      subTxt: 'Bogotá',
      dist: 0.9,
      reviews: 74,
      rating: 4.5,
      perNight: 60000,
      roomData: RoomData(1, 3),
      isSelected: false,
      date: DateText(2, 6),
      location: LatLng(51.505799, -0.137904),
    ),
    HotelListData(
      imagePath: Localfiles.hotel_3,
      titleTxt: 'Apartaestudio',
      subTxt: 'Bogotá',
      dist: 0.5,
      reviews: 62,
      rating: 4.0,
      perNight: 65000,
      roomData: RoomData(2, 3),
      isSelected: false,
      date: DateText(5, 9),
      location: LatLng(51.499162, -0.119788),
    ),
    HotelListData(
      imagePath: Localfiles.hotel_4,
      titleTxt: 'Apartaestudio',
      subTxt: 'Medellín',
      dist: 1.0,
      reviews: 90,
      rating: 4.4,
      perNight: 75000,
      isSelected: false,
      roomData: RoomData(2, 2),
      date: DateText(1, 5),
      location: LatLng(51.519541, -0.114503),
    ),
    HotelListData(
      imagePath: Localfiles.hotel_5,
      titleTxt: 'Apartaestudio',
      subTxt: 'Cali',
      dist: 1.0,
      reviews: 240,
      rating: 4.5,
      isSelected: false,
      perNight: 80000,
      roomData: RoomData(1, 7),
      date: DateText(1, 4),
      location: LatLng(51.508383, -0.109502),
    ),
  ];

  static List<HotelListData> popularList = [
    HotelListData(
      imagePath: Localfiles.popular_1,
      titleTxt: 'Esstudia',
    ),
    HotelListData(
      imagePath: Localfiles.popular_2,
      titleTxt: 'City U',
    ),
    HotelListData(
      imagePath: Localfiles.popular_3,
      titleTxt: 'The Spot For Living',
    ),
    HotelListData(
      imagePath: Localfiles.popular_4,
      titleTxt: 'LivinnXBogotá',
    ),
    HotelListData(
      imagePath: Localfiles.popular_5,
      titleTxt: 'Casa Clandestina',
    ),
    HotelListData(
      imagePath: Localfiles.popular_6,
      titleTxt: 'BOHO U Living',
    ),
  ];

  static List<HotelListData> reviewsList = [
    HotelListData(
      imagePath: Localfiles.avatar1,
      titleTxt: 'Alexia Jane',
      subTxt:
          'Se encuentra en un excelente lugar cerca a la universidad, en una ubicación muy tranquila y comoda.',
      rating: 8.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: Localfiles.avatar3,
      titleTxt: 'Jacky Depp',
      subTxt:
          'Cama muy cómoda, ubicación muy tranquila; el lugar podría beneficiarse de una actualización.',
      rating: 8.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: Localfiles.avatar5,
      titleTxt: 'Alex Carl',
      subTxt:
          'Se encuentra en un excelente lugar cerca a la universidad, en una ubicación muy tranquila y comoda.',
      rating: 6.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: Localfiles.avatar2,
      titleTxt: 'May June',
      subTxt:
          'Cama muy cómoda, ubicación muy tranquila; el lugar podría beneficiarse de una actualización.',
      rating: 9.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: Localfiles.avatar4,
      titleTxt: 'Lesley Rivas',
      subTxt:
          'Se encuentra en un excelente lugar cerca a la universidad, en una ubicación muy tranquila y comoda.',
      rating: 8.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: Localfiles.avatar6,
      titleTxt: 'Carlos Lasmar',
      subTxt:
          'Cama muy cómoda, ubicación muy tranquila; el lugar podría beneficiarse de una actualización.',
      rating: 7.0,
      dateTxt: '21 May, 2019',
    ),
    HotelListData(
      imagePath: Localfiles.avatar7,
      titleTxt: 'Oliver Smith',
      subTxt:
          'Se encuentra en un excelente lugar cerca a la universidad, en una ubicación muy tranquila y comoda.',
      rating: 9.0,
      dateTxt: '21 May, 2019',
    ),
  ];

  static List<HotelListData> romeList = [
    HotelListData(
        imagePath:
            'assets/images/room_1.jpg assets/images/room_2.jpg assets/images/room_3.jpg',
        titleTxt: 'Deluxe Room',
        perNight: 180,
        dateTxt: 'Sleeps 3 people',
        roomData: RoomData(2, 2)),
    HotelListData(
        imagePath:
            'assets/images/room_4.jpg assets/images/room_5.jpg assets/images/room_6.jpg',
        titleTxt: 'Premium Room',
        perNight: 200,
        dateTxt: 'Sleeps 3 people + 2 children',
        roomData: RoomData(3, 2)),
    HotelListData(
        imagePath:
            'assets/images/room_7.jpg assets/images/room_8.jpg assets/images/room_9.jpg',
        titleTxt: 'Queen Room',
        perNight: 240,
        dateTxt: 'Sleeps 4 people + 4 children',
        roomData: RoomData(4, 4)),
    HotelListData(
        imagePath:
            'assets/images/room_10.jpg assets/images/room_11.jpg assets/images/room_12.jpg',
        titleTxt: 'King Room',
        perNight: 240,
        dateTxt: 'Sleeps 4 people + 4 children',
        roomData: RoomData(4, 4)),
    HotelListData(
        imagePath:
            'assets/images/room_11.jpg assets/images/room_1.jpg assets/images/room_2.jpg',
        titleTxt: 'Hollywood Twin\nRoom',
        perNight: 260,
        dateTxt: 'Sleeps 4 people + 4 children',
        roomData: RoomData(4, 4)),
  ];

  static List<HotelListData> hotelTypeList = [
    HotelListData(
      imagePath: Localfiles.hotel_Type_1,
      titleTxt: 'hotel_data',
      isSelected: false,
    ),
    HotelListData(
      imagePath: Localfiles.hotel_Type_2,
      titleTxt: 'Backpacker_data',
      isSelected: false,
    ),
    
  ];
  static List<HotelListData> lastsSearchesList = [
    HotelListData(
      imagePath: Localfiles.popular_4,
      titleTxt: 'LivinnXBogotá',
      roomData: RoomData(1, 2),
      date: DateText(4, 6),
      dateTxt: '',
    ),
    HotelListData(
      imagePath: Localfiles.popular_1,
      titleTxt: 'Esstudia',
      roomData: RoomData(1,2),
      date: DateText(2, 4),
      dateTxt: '',
    ),
    // HotelListData(
    //   imagePath: Localfiles.city_3,
    //   titleTxt: 'New York',
    //   roomData: RoomData(1, 3),
    //   date: DateText(20, 22),
    //   dateTxt: '20 - 22 Sep',
    // ),
    // HotelListData(
    //   imagePath: Localfiles.city_4,
    //   titleTxt: 'Tokyo',
    //   roomData: RoomData(12, 22),
    //   date: DateText(12, 22),
    //   dateTxt: '12 - 22 Nov',
    // ),
    // HotelListData(
    //   imagePath: Localfiles.city_5,
    //   titleTxt: 'Shanghai',
    //   roomData: RoomData(10, 15),
    //   date: DateText(10, 15),
    //   dateTxt: '10 - 15 Dec',
    // ),
    // HotelListData(
    //   imagePath: Localfiles.city_6,
    //   titleTxt: 'Moscow',
    //   roomData: RoomData(12, 14),
    //   date: DateText(12, 14),
    //   dateTxt: '12 - 14 Dec',
    // ),
  ];
}
