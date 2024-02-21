import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String genderType = '';
  String weightInput = '';
  String heightInput = '';

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String dropdownValue = 'One';

  int calculateBodyMassIndex() {
    var resultBMI;
    var weight = int.parse(weightInput);
    var height = (int.parse(heightInput))/100;

    resultBMI = weight/(height*height);
    return resultBMI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  children: [
                    PageIcon(),
                    SizedBox(height: 10),
                    AgeInput(),
                    SizedBox(height: 30),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Gender",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff11446e),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: Text("Female",
                                    style: TextStyle(fontSize: 14)),
                                value: "female",
                                visualDensity: VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                groupValue: genderType,
                                onChanged: (value) {
                                  setState(() {
                                    genderType = value.toString();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: Text("Male",
                                    style: TextStyle(fontSize: 14)),
                                value: "male",
                                groupValue: genderType,
                                visualDensity: VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    genderType = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Height",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff11446e),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _heightController,
                            decoration: InputDecoration(
                              hintText: "Enter your height in cm",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Weight",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Color(0xff11446e),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _weightController,
                            decoration: InputDecoration(
                              hintText: "Enter your weight in kg",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Body Mass Index",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff11446e),
                            ),
                          ),
                        ),
                        Expanded(
                          child:  MaterialButton(
                            onPressed: () {
                              setState(() {
                                heightInput = _heightController.text;
                                weightInput = _weightController.text;
                              });
                            },
                            color: Colors.blue,
                            child: const Text('Calculate BMI', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Select your disease",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xff11446e),
                            ),
                          ),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            style: const TextStyle(color: Colors.grey),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: const[
                              DropdownMenuItem<String>(
                                value: 'One',
                                child: Text('Gluten Free'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Two',
                                child: Text('Celiac'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Three',
                                child: Text('Beriberi'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Four',
                                child: Text('Rickets'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Five',
                                child: Text('Crohns Disease'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Please choose your aim",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff11446e),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: Text("Lose Weight",
                                    style: TextStyle(fontSize: 14)),
                                value: "loseweight",
                                visualDensity: VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                groupValue: genderType,
                                onChanged: (value) {
                                  setState(() {
                                    genderType = value.toString();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: Text("Gain Weight",
                                    style: TextStyle(fontSize: 14)),
                                value: "gainweight",
                                groupValue: genderType,
                                visualDensity: VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    genderType = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    RegisterButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageIcon extends StatelessWidget {
  const PageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Icon(Icons.add_chart, size: 50);
  }
}

class AgeInput extends StatelessWidget {
  const AgeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Age",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Color(0xff11446e),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Enter your age",
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          backgroundColor: Color(0xff11446e),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/HomeScreen");
        },
        child: Text(
          "Register",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}




