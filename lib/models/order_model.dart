class OrderModel
{
  int id;
  String image;
  String name;
  double rate;
  dynamic status;
  dynamic time;
  double progress;

  OrderModel.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    rate = json['rate'];
    status = json['status'];
    time = json['time'];
    progress = json['progress'];
  }
}