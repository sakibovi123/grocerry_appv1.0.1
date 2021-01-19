import 'package:flutter/material.dart';



class WidgetProduct extends StatefulWidget {

  WidgetProduct({
    Key key, this.labelName, this.tagId
  }):super(Key: key);


  @override
  _WidgetProductState createState() => _WidgetProductState();
}

class _WidgetProductState extends State<WidgetProduct> {

  @override
  void initState() {
    ApiService apiService;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf8f8f8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Text(
                  // this.widget.labelName,
                  '#',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 4),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          _productList(),
        ],
      ),
    );
  }

  Widget _productList() {
    return FutureBuilder(
      future: apiSerice.getProducts(this.widget.tagId),
      builder: (BuildContext context, AsyncSnapshot<List<ProductMode>> model) {
        if(model.hasData){
          return _buildProductList(model.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildProductList(List<ProductModel> items){
    return Container(
      height: 200,
      alignment: Alignment.centerLeft,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index){
          var data = items[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                height: 130 ,
                width: 120,
                alignment: Alignment.center,
                child: Image.network(
                  data.images[0].src,
                  height:120,

                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xe8e8e8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0,5),
                      blurRadius: 6,
                    ),
                  ]
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:4, left: 4),
                width: 140,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      '${data.regularPrice}',
                      /// Style If you have any //
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      '${data.salePrice}',
                      /// Style If you have any //
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );


        },
      ),
    );
  }

}

/// To SHOW OUTPUT we must define the parameters in the home.dart


// ClassName(labelName: "Top Sales", tagId: Config.todayOffersTagId);
