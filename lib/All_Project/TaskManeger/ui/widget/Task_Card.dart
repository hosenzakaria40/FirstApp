import 'package:fast_app/All_Project/TaskManeger/core/app_color.dart';
import 'package:fast_app/All_Project/TaskManeger/ui/widget/text_design.dart';
import 'package:flutter/material.dart';

class Task_Card extends StatelessWidget {
  final String title;
  final String subtitle;
  final String chipText;
  final VoidCallback onEdit;
  final Color backgroundColor;
  final VoidCallback onDelete;

  const Task_Card({
    super.key,
    required this.title,
    required this.subtitle,
    required this.chipText,
    required this.onEdit,
    required this.onDelete,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,

      child: ListTile(
        title: CustomTextDesign(
          text: title,
          fontSize: 25,
          color: AppColor.primaryText,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextDesign(
              text: subtitle,
              fontSize: 15,
              color: AppColor.secondaryText,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 5),
            CustomTextDesign(
              text: DateTime.now().toString(),
              fontSize: 10,
              color: AppColor.secondaryText,
              fontWeight: FontWeight.bold,
            ),
            Row(
              children: [
                Chip(
                  label: CustomTextDesign(
                    text: chipText,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryIcon,
                  ),
                  backgroundColor: backgroundColor,
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: onEdit,
                  icon: Icon(
                    Icons.edit_note,
                    color: AppColor.secondaryText,
                    size: 20,
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete,
                    color: AppColor.deleteColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
