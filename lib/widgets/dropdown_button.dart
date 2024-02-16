import 'package:currency_converter/services/currency_services.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    super.key,
    required this.value,
    required this.onPresseddropdown,
  });

  final String value;
  final void Function(Object?) onPresseddropdown;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CurrencyServices().getApi1(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color.fromARGB(136, 158, 158, 158),
              ),
            ),
            child: DropdownButton(
              value: widget.value,
              items: snapshot.data!.keys.toSet().map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: widget.onPresseddropdown,
              style: const TextStyle(
                color: Colors.white,
              ),
              dropdownColor: Colors.black,
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
