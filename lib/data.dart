List<String> images = [
  "assets/image_04.jpg",
  "assets/image_03.jpg",
  "assets/image_02.jpg",
  "assets/image_01.png",
  "assets/image_04.jpg",
  "assets/image_03.jpg",
  "assets/image_02.jpg",
  "assets/image_01.png",
];

var myJson = {
  "country": [
    {
      "name": "United States",
      "id": "usa",
      "states": [
        {
          "name": "State 1 USA",
          "id": "usaState1",
          "cities": [
            {"name": "City 1", "id": "usaState1City1", "area": "12345 sqkm"},
            {"name": "City 2", "id": "usaState1City2", "area": "12345 sqkm"}
          ]
        },
        {
          "name": "State 2 USA",
          "id": "usaState2",
          "cities": [
            {"name": "City 3", "id": "usaState2City3", "area": "12345 sqkm"},
            {"name": "City 4", "id": "usaState2City4", "area": "12345 sqkm"}
          ]
        }
      ]
    },
    {
      "name": "Australia",
      "id": "aus",
      "states": [
        {
          "name": "State 1 Australia",
          "id": "ausState1",
          "cities": [
            {"name": "City 5", "id": "ausState1City5", "area": "12345 sqkm"},
            {"name": "City 6", "id": "ausState1City6", "area": "12345 sqkm"}
          ]
        },
        {
          "name": "State 2 Australia",
          "id": "ausState2",
          "cities": [
            {"name": "City 7", "id": "ausState2City7", "area": "12345 sqkm"},
            {"name": "City 8", "id": "ausState2City8", "area": "12345 sqkm"}
          ]
        }
      ]
    }
  ]
};
