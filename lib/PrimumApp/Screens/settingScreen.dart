
import 'package:flutter/material.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // InkWell(
              //   onTap: (){
              //
              //   },
              //   child: CircleAvatar(
              //     radius: 60,
              //     child: Image.memory(base64Decode("/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQEhAQDw8PDxAVEhIQEBAPEBAPDxAPFREWFhUVFRMYHSsgGBslGxMVIT0hJSkrLi8uFx8zODM4NzQtLisBCgoKDQ0NFQ8PFysfHRkuOC03KysrLS0rLSs3LSsrKy0tLS0tLSsrLTgrNy04Ky0tKystKysrLjctKzcrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAcAAEAAgIDAQAAAAAAAAAAAAAABAUGBwECAwj/xABDEAACAgECAwUFBAcCDwAAAAAAAQIDEQQSBSFBBhMxUWEUInGBkQcyU7FSkpOhwdHSYuEWFyMlNERUc3SCo7Kz8PH/xAAWAQEBAQAAAAAAAAAAAAAAAAAAAQL/xAAZEQEBAAMBAAAAAAAAAAAAAAAAEQESYTH/2gAMAwEAAhEDEQA/AN4gAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHnfaoRlN5ainJqKcpNJZ5RXNv0PQga27L2rp+YFPxTtFq47fZuHW3prOZTUHH4xx4/MaLj2tcHO/h04NSS2QmpWOL8ZJeDx5ZRYq5R8XgkK6LKiamdJ3Rj96UY/FpGEdqO2HseoqoVe5SjGcm5NNqUnHEfJ4j1z4mvftX4hKniE81xnGVdW1zw3iMFlL0zL6tiK3v7VX+JD9aI9qr/Eh+tE+WFx5fgw/UX8zuuPQ60r5Vx/qNadSvqT2qv8SH60R7VX+JD9aJ8uPjtf4X/Sh/UdJceXSmHzhFfxGnSvqdamt8lODfkpRPU+VKuMuyUa4U1qU5Rri8JNSm1GLz8WjdvG+2Ps2pp06rcozjU5Scnu/yjx7uOSwsPnnPoZgyjiPFLYTcKdNK3EN29zUYOX6")),
              //   )
              // ),
              SizedBox(height: 20),
              Text("data"),
             SizedBox(height: 30),
              ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                    elevation: MaterialStateProperty.all(10),
                  ),
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("data",style: TextStyle(color: Colors.black),),
                  Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.black,)
                ],
              )),
              ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                    elevation: MaterialStateProperty.all(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("data",style: TextStyle(color: Colors.black),),
                      Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.black,)
                    ],
                  )),
              ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                    elevation: MaterialStateProperty.all(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("data",style: TextStyle(color: Colors.black),),
                      Icon(Icons.arrow_forward_ios_sharp,size: 20,color: Colors.black,)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
