import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_fly/extension/my_extension.dart';
import 'package:task_fly/utils/app_colors.dart';
import 'package:task_fly/utils/app_string.dart';
import 'package:task_fly/view/component/button/common_button.dart';
import 'package:task_fly/view/component/text/common_text.dart';
import 'package:task_fly/view/component/text_field/common_text_field.dart';

import '../../../../../controllers/provider/post_task_controller.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CommonText(
          text: AppString.whereDoYouNeedItDone,
          top: 20,
          bottom: 12,
        ),
        const TaskTypeSelector(),
        16.height,
        CommonTextField(
          prefixIcon: const Icon(CupertinoIcons.location_solid),
          hintText: AppString.address,
          fillColor: AppColors.p_50,
        ),
        12.height,
        DateSelector(),
        const TaskScheduling(),
        const Spacer(),
        CommonButton(
          titleText: AppString.next,
          onTap: () => PostTaskController.instance.changeStep(2),
        ),
        30.height
      ],
    );
  }
}

class DateSelector extends StatefulWidget {
  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  String _selectedDateOption = "Before Sep 20";
  DateTime? selectedDate;
  bool isFlexible = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => _selectDate(context),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonText(
                  text: 'On date',
                  fontSize: 12,
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        12.width,
        Expanded(
          child: ElevatedButton(
            onPressed: () => _selectDate(context),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: CommonText(
                  text: _selectedDateOption,
                  fontSize: 12,
                )),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        12.width,
        Expanded(
          child: CommonButton(
            onTap: () {
              isFlexible = !isFlexible;
              setState(() {});
            },
            buttonHeight: 48,
            titleText: "I'm Flexible",
            titleSize: 12,
            titleColor: isFlexible ? AppColors.white : AppColors.clientColor,
            buttonColor:
                isFlexible ? AppColors.clientColor : AppColors.transparent,
            borderColor: AppColors.clientColor,
          ),
        ),
      ],
    );
  }

  void _selectDateOption(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        const PopupMenuItem(
          value: 'Before Sep 20',
          child: Text('Before Sep 20'),
        ),
        const PopupMenuItem(
          value: 'After Sep 20',
          child: Text('After Sep 20'),
        ),
      ],
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedDateOption = value;
        });
      }
    });
  }
}

class TaskScheduling extends StatefulWidget {
  const TaskScheduling({super.key});

  @override
  _TaskSchedulingState createState() => _TaskSchedulingState();
}

class _TaskSchedulingState extends State<TaskScheduling> {
  bool _certainTime = false;
  TimeSlot? _selectedTimeSlot = TimeSlot.evening;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: _certainTime,
              onChanged: (bool? value) {
                setState(() {
                  _certainTime = value!;
                });
              },
            ),
            const CommonText(text: AppString.needCertainTimeDay),
          ],
        ),
        const CommonText(
          text: AppString.whatTimeDoYouNeedTheWorker,
          fontWeight: FontWeight.bold,
        ),
        10.height,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTimeSlotOption(TimeSlot.morning, 'Morning', '9AM-12PM'),
              12.width,
              _buildTimeSlotOption(TimeSlot.midday, 'Midday', '12PM-3PM'),
              12.width,
              _buildTimeSlotOption(TimeSlot.afternoon, 'Afternoon', '3PM-7PM'),
              12.width,
              _buildTimeSlotOption(TimeSlot.evening, 'Evening', '7PM-9PM',
                  isSelected: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlotOption(TimeSlot timeSlot, String title, String subtitle,
      {bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTimeSlot = timeSlot;
        });
      },
      child: Container(
        width: 85,
        padding: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: _selectedTimeSlot == timeSlot ? Colors.blue : Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
          color: _selectedTimeSlot == timeSlot ? Colors.blue : Colors.white,
        ),
        child: Column(
          children: [
            Icon(
              _getIconForTimeSlot(timeSlot),
              size: 30.0,
              color: _selectedTimeSlot == timeSlot ? Colors.white : Colors.blue,
            ),
            6.height,
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color:
                    _selectedTimeSlot == timeSlot ? Colors.white : Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color:
                    _selectedTimeSlot == timeSlot ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForTimeSlot(TimeSlot timeSlot) {
    switch (timeSlot) {
      case TimeSlot.morning:
        return Icons.wb_sunny_outlined;
      case TimeSlot.midday:
        return Icons.wb_sunny;
      case TimeSlot.afternoon:
        return Icons.sunny_snowing;
      case TimeSlot.evening:
        return Icons.nightlight_round;
      default:
        return Icons.wb_sunny;
    }
  }
}

enum TimeSlot { morning, midday, afternoon, evening }

class TaskTypeSelector extends StatefulWidget {
  const TaskTypeSelector({super.key});

  @override
  _TaskTypeSelectorState createState() => _TaskTypeSelectorState();
}

class _TaskTypeSelectorState extends State<TaskTypeSelector> {
  TaskType _selectedTaskType = TaskType.inPerson;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // In-person option
        _buildOption(
          title: AppString.inPerson,
          description: AppString.inPersonDetails,
          icon: Icons.location_on,
          value: TaskType.inPerson,
        ),
        12.width,
        _buildOption(
          title: AppString.online,
          description: AppString.onlineDetails,
          icon: Icons.computer,
          value: TaskType.online,
        ),
      ],
    );
  }

  Widget _buildOption(
      {required String title,
      required String description,
      required IconData icon,
      required TaskType value}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTaskType = value;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AppColors.p_50,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<TaskType>(
                    value: value,
                    activeColor: AppColors.clientColor,
                    groupValue: _selectedTaskType,
                    onChanged: (TaskType? newValue) {
                      setState(() {
                        _selectedTaskType = newValue!;
                      });
                    },
                  ),
                  CommonText(
                    text: title,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              CommonText(
                text: description,
                fontSize: 14,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),
              10.height,
              Icon(
                icon,
                size: 30.0,
                color: AppColors.p_500,
              ).start,
            ],
          ),
        ),
      ),
    );
  }
}

enum TaskType { inPerson, online }
