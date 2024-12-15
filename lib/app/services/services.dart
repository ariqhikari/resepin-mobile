import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:resepin/app/data/data.dart';
import 'package:resepin/app/shared/shared.dart';

part 'auth_services.dart';
part 'menu_services.dart';

const String baseURL = 'http://localhost:3000/api';
