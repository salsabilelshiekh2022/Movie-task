import 'package:movie_task/core/helper/app_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/movies_cubit/movies_cubit.dart';

class MoviesSearchBar extends StatefulWidget {
  const MoviesSearchBar({super.key});

  @override
  State<MoviesSearchBar> createState() => _MoviesSearchBarState();
}

class _MoviesSearchBarState extends State<MoviesSearchBar> {
  late final TextEditingController _searchController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (_searchController.text == query && mounted) {
        context.read<MoviesCubit>().searchMovies(query);
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    _focusNode.unfocus();
    context.read<MoviesCubit>().clearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            focusNode: _focusNode,
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: 'Search movies...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: state.isSearching
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _clearSearch,
                    )
                  : null,
              border: _buildBorder(),
              enabledBorder: _buildBorder(),
              focusedBorder: _buildBorder(color: context.colors.primaryColor),
              filled: true,
              fillColor: Colors.grey[50],
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color ?? Colors.grey[300]!),
    );
  }
}
