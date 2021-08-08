<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${not empty sessionScope.locale}">
    <fmt:setLocale value="${sessionScope.locale}"/>
</c:if>
<fmt:setBundle basename="locale"/>

<fmt:message key="main.add.dessert" var="locale_add_dessert"/>
<fmt:message key="admin.dessert.name" var="locale_dessert_name"/>
<fmt:message key="main.name" var="locale_main_name"/>
<fmt:message key="main.description" var="locale_main_description"/>
<fmt:message key="admin.description.item" var="locale_description_item"/>
<fmt:message key="main.category" var="locale_main_category"/>
<fmt:message key="main.category.enter" var="locale_category_enter"/>
<fmt:message key="admin.dessert.weight" var="locale_dessert_weight"/>
<fmt:message key="admin.dessert.amount" var="locale_dessert_amount"/>
<fmt:message key="admin.dessert.price" var="locale_dessert_price"/>
<fmt:message key="admin.price.name" var="locale_price_name"/>
<fmt:message key="admin.storage.name" var="locale_storage_name"/>
<fmt:message key="admin.storage.dessert" var="locale_storage_dessert"/>
<fmt:message key="admin.dessert.image" var="locale_dessert_image"/>
<fmt:message key="admin.update.item" var="locale_update_item"/>
<fmt:message key="main.cancel" var="locale_main_cancel"/>
<%--<fmt:message key="admin.soil.podzolic" var="locale_soil_podzolic"/>--%>
<%--<fmt:message key="admin.soil.sodpodzolic" var="locale_soil_sodpodzolic"/>--%>
<%--<fmt:message key="admin.soil.unpaved" var="locale_soil_unpaved"/>--%>

<fmt:message key="main.edit.dessert" var="locale_edit_dessert"/>
<fmt:message key="admin.dessert.name" var="locale_dessert_name"/>
<fmt:message key="main.name" var="locale_main_name"/>
<fmt:message key="main.description" var="locale_main_description"/>
<fmt:message key="admin.description.item" var="locale_description_item"/>
<fmt:message key="main.category" var="locale_main_category"/>
<fmt:message key="main.category.enter" var="locale_category_enter"/>
<fmt:message key="admin.dessert.weight" var="locale_dessert_weight"/>
<fmt:message key="admin.dessert.price" var="locale_dessert_price"/>
<fmt:message key="admin.price.name" var="locale_price_name"/>
<fmt:message key="admin.storage.name" var="locale_storage_name"/>
<fmt:message key="admin.dessert.image" var="locale_dessert_image"/>
<fmt:message key="main.add.item" var="locale_add_item"/>
<fmt:message key="main.cancel" var="locale_main_cancel"/>


<!doctype html>
<html>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="container">
    <div class="row">
<%--        <c:if test="${wrongInput}">--%>
<%--            <div class="alert alert-danger">--%>
<%--                Oooops, some fields have incorrect input.--%>
<%--                Remember: watering, price and count in storage should have positive amount--%>
<%--            </div>--%>
<%--        </c:if>--%>
        <form class="form-horizontal" style="margin-top: 10px; margin-left: 220px"  action="controller" method="post" enctype="multipart/form-data">
            <fieldset>
                <input type="hidden" name="command" value="update_dessert_command"/>
                <legend class="center-block">${locale_edit_dessert}</legend>
                <input type="hidden" name="dessertId" value="${dessert.id}"/>
                        <!--Name of Item-->
                <div class="form-group">
                        <input required type="text" class="form-control" id="name" max="50"
                               name="name" value="${dessert.name}"
                               placeholder="${locale_main_name}" pattern="${attribute_regexp_name}"/>
                </div>

                <!--Description-->
                <div class="form-group">
                    <textarea required rows="5" class="form-control" id="description" name="description" maxlength="1000" minlength="5" placeholder="${locale_main_description}">${dessert.description}</textarea>
                </div>

                <!--Category-->
                <div class="form-group">
                        <select required title="${dessert.dessertType}" id="category" name="category" class="form-control">
                            <option value="" selected="selected" disabled="disabled">${locale_category_enter}</option>
                            <c:forEach var="dessertType" items="${dessertTypeList}">
                                <option value="${dessertType.id}"
                                        <c:if test="${dessert.dessertType.id == dessertType.id}">selected</c:if>>
                                        ${dessertType.description}</option>
                            </c:forEach>
                        </select>
                </div>

                <!--Weight-->
                <div class="form-group">
                        <input required value="${dessert.weight}" type="text" min="0"
                               class="form-control" id="weight" name="weight"
                               placeholder="${locale_dessert_weight}" pattern="${attribute_regexp_weight}"/>
                </div>

                <!--Price-->
                <div class="form-group">
                            <input required value="${dessert.price}" type="text" step="0.1" min="1"
                                   class="form-control" id="price" name="price"
                                   placeholder="${locale_price_name}" pattern="${attribute_regexp_price}"/>
                </div>

                <!--In storage-->
                <div class="form-group">
                       <input required value="${dessert.storage.count}" type="text" min="1" max="99"
                               class="form-control" id="count" name="count"
                               placeholder="${locale_storage_dessert}" pattern="${attribute_regexp_count}"/>
                </div>


                <div class="form-group" style="margin-left: 150px">
                        <button type="submit" class="btn btn-success">${locale_update_item}</button>
                        <a class="btn btn-danger" href=""${pageContext.request.contextPath}/сontroller?command=go_to_dessert_page_command">${locale_main_cancel}</a>
                </div>
            </fieldset>
        </form>
    </div>
</div>
</body>
</html>