import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreBloc.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreEvent.dart';
import 'package:whatibeendoing/src/presentation/blocs/store_data/StoreState.dart';
import 'package:whatibeendoing/src/presentation/widgets/NavigationDrawerWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StoreDataView extends StatefulWidget {
  late AppLocalizations locale;

  @override
  State<StatefulWidget> createState() => _StoreDataViewState();
}

class _StoreDataViewState extends State<StoreDataView> {
  TextEditingController textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    widget.locale = AppLocalizations.of(context)!;
    return BlocListener<StoreBloc, StoreState>(
      listener: (_, state) {
        if (state.storeTextStatus?.savedText) {
          textInputController.clear();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.locale.sdv_view_title),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        drawer: NavigationDrawerWidget(),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _TextInput(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              context.read<StoreBloc>().add(SaveText(textInputController.text));
            },
            child: Text(widget.locale.sdv_view_btn_save),
            style: ElevatedButton.styleFrom(primary: Colors.redAccent),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      BlocBuilder<StoreBloc, StoreState>(
                        builder: (_, state) {
                          if (state is StoreError) {
                            return Text(
                              widget.locale.sdv_view_empty_text,
                              style: TextStyle(fontSize: 25, color: Colors.redAccent),
                            );
                          }
                          if (state is StoreDone) {
                            if (state.storeTextStatus!.loadingText) {
                              return CircularProgressIndicator();
                            } else {
                              return Text(
                                state.storeTextStatus!.loadedText!,
                                style: TextStyle(fontSize: 25, color: Colors.greenAccent),
                              );
                            }
                          }
                          return const SizedBox();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<StoreBloc>().add(GetText());
                        },
                        child: Text(widget.locale.sdv_view_btn_get),
                        style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _TextInput() {
    final locale = AppLocalizations.of(context)!;
    return TextField(
      controller: textInputController,
      decoration: InputDecoration(
          hintText: locale.sdv_view_ti_helper,
          labelText: locale.sdv_view_ti_placeholder,
          labelStyle: TextStyle(fontSize: 14, color: Colors.black45),
          border: OutlineInputBorder()),
      keyboardType: TextInputType.name,
      obscureText: false,
    );
  }
}
