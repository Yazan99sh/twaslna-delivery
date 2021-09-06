import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:twaslna_delivery/module_search/state_manager/search_state_manager.dart';
import 'package:twaslna_delivery/module_search/ui/state/store_list/search_empty_state.dart';
import 'package:twaslna_delivery/module_search/ui/state/store_list/search_loading_state.dart';
import 'package:twaslna_delivery/module_search/ui/state/store_list/search_state.dart';
import 'package:twaslna_delivery/module_stores/state_manager/store_list_state_manager.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_list/store_list_loading_state.dart';
import 'package:twaslna_delivery/module_stores/ui/state/store_list/store_list_state.dart';
import 'package:twaslna_delivery/utils/components/costom_search.dart';
import 'package:twaslna_delivery/utils/models/store_category.dart';

@injectable
class SearchScreen extends StatefulWidget {
  final SearchStateManager _storeListManager;

  SearchScreen(this._storeListManager);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late SearchState currentState;
  bool flagId = true;
  String? title;
  TextEditingController controller = TextEditingController();
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  void getSearchResult(String key){
    widget._storeListManager.getSearchResult(key, this);
  }

  @override
  void initState() {
    super.initState();
    currentState = SearchEmptyState(this, '');
    widget._storeListManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (focus.canRequestFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          title:CustomDeliverySearch(hintText:'',controller: controller,onChanged: (value){
            getSearchResult(value);
          },
          autoFocus: true,
          background:Theme.of(context).backgroundColor
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap:()=>Navigator.of(context).pop(),
                child: Container(
                  decoration: BoxDecoration(
                    color:Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      color:Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
        ),
        body: currentState.getUI(context),
      ),
    );
  }
}
