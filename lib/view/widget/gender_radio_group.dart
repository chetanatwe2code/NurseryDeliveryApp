import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

enum Gender { male,female }

class GenderRadioGroup extends StatefulWidget {
  final Gender? initialValue;
  final Function(Gender gender)? callback;
  const GenderRadioGroup({Key? key,this.initialValue,this.callback}) : super(key: key);

  @override
  State<GenderRadioGroup> createState() => _GenderRadioGroupState();
}

class _GenderRadioGroupState extends State<GenderRadioGroup> {

  Gender? selected;
  int? id;

  @override
  void initState() {
    super.initState();
    if(widget.initialValue == Gender.male){
      selected = Gender.male;
      id = 1;
    }if(widget.initialValue == Gender.female){
      selected = Gender.female;
      id = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                selected = Gender.male;
                id = 1;
                if(widget.callback != null){
                  widget.callback!(selected!);
                }
                setState(() {});

              },
            ),
            Text(
              'Male',
              style: TextStyle(
                  color: AppColors.textColor(),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal
              ),
            ),

            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                selected = Gender.female;
                id = 2;
                if(widget.callback != null){
                  widget.callback!(selected!);
                }
                setState(() {});
              },
            ),
            Text(
              'Female',
              style: TextStyle(
                  color: AppColors.textColor(),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.normal
              ),
            ),
          ],
        ),
      ],
    );
  }
}
