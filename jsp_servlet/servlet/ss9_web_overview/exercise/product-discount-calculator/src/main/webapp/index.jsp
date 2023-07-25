<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
        form {
            margin-top: 10px;
        }
    </style>
</head>
<body>
<form action="/display-discount" method="post">
    <div>
        <label for="des">Product Description</label>
        <br>
        <input type="text" id="des" name="description" placeholder="Description here"/>
    </div>
    <br>
    <div>
        <label for="pr">List Price</label>
        <br>
        <input type="text" id="pr" name="price" placeholder="Price here"/>
    </div>
    <br>
    <div>
        <label for="pc">Discount Percent</label>
        <br>
        <input type="text" id="pc" name="percent" placeholder="Discount Percent here"/>
    </div>
    <br>
    <input type="submit" id="submit" value="Calculator Discount"/>
</form>

</body>
</html>