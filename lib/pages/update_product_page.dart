import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_text_field_widget.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key, required this.product});
  static String id = "UpdateProductPage";
  final ProductModel product;

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.product.title;
    priceController.text = widget.product.price.toString();
    descriptionController.text = widget.product.description;
    imageController.text = widget.product.image;
    categoryController.text = widget.product.category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Product"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextFieldWidget(
                myController: nameController,
                hintText: "Enter Product Name",
                labelText: "Product Name",
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldWidget(
                  myController: priceController,
                  hintText: "Enter Product Price",
                  labelText: "Product Price",
                  keyboardType: TextInputType.number),
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldWidget(
                myController: descriptionController,
                hintText: "Enter Product Description",
                labelText: "Product Description",
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldWidget(
                  myController: imageController,
                  labelText: "Product Image",
                  hintText: "Enter Product Image"),
              const SizedBox(
                height: 50,
              ),
              CustomTextFieldWidget(
                myController: categoryController,
                hintText: "Enter Product Category",
                labelText: "Product Category",
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () async {
                  isLoading = true;
                  setState(() {});
                  ProductModel product = ProductModel(
                    id: widget.product.id,
                    title: nameController.text,
                    price: double.tryParse(priceController.text)!,
                    description: descriptionController.text,
                    image: imageController.text,
                    category: categoryController.text.isEmpty
                        ? widget.product.category
                        : categoryController.text,
                    rating: widget.product.rating,
                  );
                  await UpdateProductService().updateProduct(product: product);
                  isLoading = false;
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
