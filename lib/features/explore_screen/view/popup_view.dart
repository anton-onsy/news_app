import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/core/utils/Appcolors.dart';
import 'package:newsapp/core/widgets/custom_btn.dart';
import 'package:newsapp/features/explore_screen/cubit/PopupCubit.dart';
import 'package:newsapp/features/explore_screen/cubit/Popup_state.dart';


class FilterPopup extends StatelessWidget {
  const FilterPopup({super.key});

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Appcolors.button_text_color;
    return BlocProvider(
      create: (context) => PopupCubit(),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: BlocBuilder<PopupCubit, PopupState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Categories
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Filter Button
                
              ],
            );
            }
          ),
        ),
      ),
    );
  }
}