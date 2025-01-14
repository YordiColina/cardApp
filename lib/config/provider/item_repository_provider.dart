import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../infraestructure/local_database/local_database.dart';


final itemRepositoryProvider = Provider((ref) => LocalDatabase());