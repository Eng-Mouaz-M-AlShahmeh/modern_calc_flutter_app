/* Developed by Eng Mouaz M Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:modern_calculator_flutter/src/state/app_provider.dart';
import 'package:modern_calculator_flutter/src/ui/globals/button.dart';
import 'package:modern_calculator_flutter/src/ui/globals/ui_helpers.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _memoryNumber = '0';
  String _screenNumber = '0';
  String _calcMethod = '';
  String _oldScreenCalcProcess = '';
  bool _resultClicked = false;

  void _storeFirstNumber(String oldScreenNumber, String calcMethod) {
    setState(() {
      _calcMethod = calcMethod;
      _oldScreenCalcProcess =
          '$_oldScreenCalcProcess$oldScreenNumber$_calcMethod';
    });
  }

  void _resultCalc(String newScreenNumber) {
    if (_memoryNumber != '0' && _calcMethod != '') {
      if (_calcMethod == 'x') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! *
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '-') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! -
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '+') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! +
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '÷') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! /
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '%') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! %
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      }
    }

    setState(() {
      _screenNumber = _memoryNumber;
      _calcMethod = '';
      _resultClicked = true;
    });
  }

  void _multiResultCalc(String newScreenNumber) {
    if (_resultClicked == true) {
      setState(() {
        _oldScreenCalcProcess = '$_memoryNumber$_calcMethod';
        _resultClicked = false;
        _screenNumber = '0';
      });
      return;
    }

    if (_memoryNumber == '0') {
      setState(() {
        _memoryNumber = newScreenNumber;
        _screenNumber = '0';
      });
      return;
    }

    setState(() {
      _screenNumber = '0';
    });

    if (_calcMethod != '') {
      if (_calcMethod == 'x') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! *
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '-') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! -
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '+') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! +
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '÷') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! /
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      } else if (_calcMethod == '%') {
        setState(() {
          _memoryNumber = (double.tryParse(_memoryNumber)! %
                  double.tryParse(newScreenNumber)!)
              .toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: screenWidth(context) * 0.89,
                  height: screenHeight(context) * 0.1,
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      context.watch<AppStateNotifier>().isDarkMode
                          ? AppTheme().unSelectedThemeButton(
                              context,
                              () {
                                context
                                    .read<AppStateNotifier>()
                                    .updateTheme(false);
                              },
                              Icons.wb_sunny_outlined,
                            )
                          : AppTheme().selectedThemeButton(
                              context,
                              () {
                                context
                                    .read<AppStateNotifier>()
                                    .updateTheme(false);
                              },
                              Icons.wb_sunny_outlined,
                            ),
                      context.watch<AppStateNotifier>().isDarkMode
                          ? AppTheme().selectedThemeButton(
                              context,
                              () {
                                context
                                    .read<AppStateNotifier>()
                                    .updateTheme(true);
                              },
                              Icons.nightlight_outlined,
                            )
                          : AppTheme().unSelectedThemeButton(
                              context,
                              () {
                                context
                                    .read<AppStateNotifier>()
                                    .updateTheme(true);
                              },
                              Icons.nightlight_outlined,
                            ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context) * 0.89,
                      height: screenHeight(context) * 0.1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  _oldScreenCalcProcess,
                                  style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontSize: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth(context) * 0.89,
                      height: screenHeight(context) * 0.2,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        reverse: true,
                        child: Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  _screenNumber,
                                  style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                    fontSize: 100,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTheme().mainCalcButton(
                      context,
                      () {
                        setState(() {
                          _memoryNumber = '0';
                          _screenNumber = '0';
                          _oldScreenCalcProcess = '';
                          _calcMethod = '';
                          _resultClicked = false;
                        });
                      },
                      'C',
                    ),
                    AppTheme().mainCalcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          return;
                        } else if (!_screenNumber.startsWith('-')) {
                          setState(() {
                            _screenNumber = '-$_screenNumber';
                          });
                        } else if (_screenNumber.startsWith('-')) {
                          setState(() {
                            _screenNumber = _screenNumber.replaceAll('-', '');
                          });
                        }
                      },
                      '+/-',
                    ),
                    AppTheme().mainCalcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          return;
                        } else {
                          _storeFirstNumber(_screenNumber, '%');
                          _multiResultCalc(_screenNumber);
                        }
                      },
                      '%',
                    ),
                    AppTheme().greenCalcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          return;
                        } else {
                          _storeFirstNumber(_screenNumber, '÷');
                          _multiResultCalc(_screenNumber);
                        }
                      },
                      '÷',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '7';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}7';
                          });
                        }
                      },
                      '7',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '8';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}8';
                          });
                        }
                      },
                      '8',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '9';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}9';
                          });
                        }
                      },
                      '9',
                    ),
                    AppTheme().greenCalcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          return;
                        } else {
                          _storeFirstNumber(_screenNumber, 'x');
                          _multiResultCalc(_screenNumber);
                        }
                      },
                      'x',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '4';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}4';
                          });
                        }
                      },
                      '4',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '5';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}5';
                          });
                        }
                      },
                      '5',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '6';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}6';
                          });
                        }
                      },
                      '6',
                    ),
                    AppTheme().greenCalcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          return;
                        } else {
                          _storeFirstNumber(_screenNumber, '-');
                          _multiResultCalc(_screenNumber);
                        }
                      },
                      '-',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '1';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}1';
                          });
                        }
                      },
                      '1',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '2';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}2';
                          });
                        }
                      },
                      '2',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '3';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}3';
                          });
                        }
                      },
                      '3',
                    ),
                    AppTheme().greenCalcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          return;
                        } else {
                          _storeFirstNumber(_screenNumber, '+');
                          _multiResultCalc(_screenNumber);
                        }
                      },
                      '+',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '0';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}00';
                          });
                        }
                      },
                      '00',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '0';
                          });
                        } else {
                          setState(() {
                            _screenNumber = '${_screenNumber}0';
                          });
                        }
                      },
                      '0',
                    ),
                    AppTheme().calcButton(
                      context,
                      () {
                        if (_screenNumber == '0') {
                          setState(() {
                            _screenNumber = '0.';
                          });
                        } else if (_screenNumber.contains('.')) {
                          return;
                        } else {
                          setState(() {
                            _screenNumber = '$_screenNumber.';
                          });
                        }
                      },
                      '.',
                    ),
                    AppTheme().resultCalcButton(
                      context,
                      () {
                        if (_screenNumber != '0') {
                          _oldScreenCalcProcess =
                              '$_oldScreenCalcProcess$_screenNumber=';
                          _resultCalc(_screenNumber);
                        }
                      },
                      '=',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
