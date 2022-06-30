// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
      required  this.id,
      required  this.name,
      required  this.username,
       required this.email,
        
       required this.phone,
       required this.website,
     
    });

    int id;
    String name;
    String username;
    String email;
 
    String phone;
    String website;
   

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
       
        phone: json["phone"],
        website: json["website"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
      
        "phone": phone,
        "website": website,
        
    };
}