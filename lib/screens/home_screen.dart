import 'package:currency_converter/models/allcurrencyrates.dart';
import 'package:currency_converter/services/currency_services.dart';
import 'package:currency_converter/widgets/dropdown_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  String amount = '';
  String value1 = 'AUD';
  String value2 = 'AUD';
  Future<Allcurrencyrates>? fetchrates;
  Future<Map>? currency;
  double output = 0.0;

  @override
  void initState() {
    super.initState();
    fetchrates = CurrencyServices().getApi();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double currencyconversion(rates) {
      setState(() {
        output = (double.parse(amount) / rates[value1] * rates[value2]);
      });
      return output;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
                future: fetchrates,
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      const Text(
                        'Currency Converter',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter the amount',
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            amount = value;
                          });
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropDown(
                            value: value1,
                            onPresseddropdown: (value) {
                              setState(() {
                                value1 = value.toString();
                              });
                            },
                          ),
                          FloatingActionButton(
                            backgroundColor: Colors.blue,
                            foregroundColor:
                                const Color.fromARGB(188, 255, 255, 255),
                            child: const Icon(
                              Icons.swap_horiz,
                              size: 35,
                            ),
                            onPressed: () {
                              setState(() {
                                String temp = value1;
                                value1 = value2;
                                value2 = temp;
                              });
                            },
                          ),
                          DropDown(
                            value: value2,
                            onPresseddropdown: (value) {
                              setState(() {
                                value2 = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.080),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.18,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Result :',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              output.toStringAsFixed(2),
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.075),
                      GestureDetector(
                        onTap: () {
                          if (snapshot.hasData) {
                            currencyconversion(snapshot.data!.rates);
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.090,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Convert',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
