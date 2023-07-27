<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Calculator</title>
</head>
<body>
<form action="/calculate" method="post">
    <h3>Calculator</h3>
    <label for="f-operand">First operand</label>
    <input type="text" name="f-operand" id="f-operand" placeholder="Enter number">
    <br>
    <label for="ope">Operator</label>
    <select name="operator" id="ope">
        <option value="addition">Addition</option>
        <option value="minus">Minus</option>
        <option value="multiplication">Multiplication</option>
        <option value="division">Division</option>
    </select>
    <br>
    <label for="s-operand">Second operand</label>
    <input type="text" name="s-operand" id="s-operand" placeholder="Enter number">
    <br>
    <input type="submit" id="submit" value="Calculator">
</form>


</body>
</html>