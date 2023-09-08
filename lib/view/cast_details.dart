import 'package:cinima_star/utils/cinima_star_responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/cast_model_class.dart';

// ignore: must_be_immutable
class CastDetailsPage extends StatelessWidget {
  Cast castdetails;
  CastDetailsPage({super.key, required this.castdetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(
          ResMobSize.width(10, context),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ResMobSize.width(30, context),
              ),
              Row(
                children: [
                  SizedBox(
                    width: ResMobSize.width(15, context),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(
                      ResMobSize.width(20, context),
                    ),
                    child: Container(
                      height: ResMobSize.width(50, context),
                      width: ResMobSize.width(50, context),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(
                          ResMobSize.width(20, context),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.chevron_back,
                          size: ResMobSize.width(20, context),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              Center(
                child: CircleAvatar(
                  radius: ResMobSize.width(140, context),
                  backgroundImage: NetworkImage(
                    "https://image.tmdb.org/t/p/w780${castdetails.profilePath}",
                  ),
                ),
              ),
              SizedBox(
                height: ResMobSize.width(20, context),
              ),
              Text(
                "Name : ${castdetails.originalName}",
                style: TextStyle(
                    fontSize: ResMobSize.width(19, context),
                    fontFamily: 'Poppins regular'),
              ),
              SizedBox(
                height: ResMobSize.width(5, context),
              ),
              Text(
                "Character : ${castdetails.character}",
                style: TextStyle(
                    fontSize: ResMobSize.width(16, context),
                    fontFamily: 'Poppins regular'),
              ),
              SizedBox(
                height: ResMobSize.width(5, context),
              ),
              Text(
                "Department : ${castdetails.knownForDepartment}",
                style: TextStyle(
                    fontSize: ResMobSize.width(16, context),
                    fontFamily: 'Poppins regular'),
              ),
              SizedBox(
                height: ResMobSize.width(5, context),
              ),
              castdetails.gender == 1
                  ? Text(
                      "Gender : Female",
                      style: TextStyle(
                        fontSize: ResMobSize.width(16, context),
                        fontFamily: 'Poppins regular',
                      ),
                    )
                  : Text(
                      "Gender : Male",
                      style: TextStyle(
                        fontSize: ResMobSize.width(16, context),
                        fontFamily: 'Poppins regular',
                      ),
                    ),
              SizedBox(
                height: ResMobSize.width(5, context),
              ),
              Text(
                "Popularity : ${castdetails.popularity}",
                style: TextStyle(
                  fontSize: ResMobSize.width(16, context),
                  fontFamily: 'Poppins regular',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
