<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                exclude-result-prefixes="#all"
                expand-text="yes"
                version="3.0">
    
    <xsl:output method="html" indent="yes"/>
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!-- <xsl:template match="/" mode="#all"> -->
    <xsl:template match="/" >
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Document</title>
                <link rel="stylesheet" href="styles/main.css"/>
            </head>
            <body>
                <div class="wrapper">
                    <h1>XML Product Listing</h1>
                    <nav class="nav">
                        <a class="nav__link" href="products.xml">Products</a>
                        <a class="nav__link nav__link--active" href="orders.xml">Orders</a>
                    </nav>
                    <table>
                        <thead>
                            <tr>
                                <th>Order No</th>
                                <th>Order Date</th>
                                <th>Cust No</th>
                                <th>Payment Method</th>
                                <th>Product SKU</th>
                                <th>Product Name</th>
                                <th>Product Price</th>
                                <th>Product Quantity</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- foreach ($products as $product){...} -->
                            <xsl:for-each select="/Orders/*">
                                <tr>
                                    <td><xsl:value-of select="@Id"/></td>
                                    <td><xsl:value-of select="OrderDate"/></td>
                                    <td><xsl:value-of select="CustNo"/></td>
                                    <td>
                                        <!-- Check the paymentMethod value and display the corresponding image -->
                                        <xsl:choose>
                                            <xsl:when test="paymentMethod='Credit Card'">
                                                <img src="images/credit_card.png" alt="Credit Card"/>
                                                <span class="image-filename credit_card"><xsl:value-of select="paymentMethod"/></span>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <img src="images/payments.png" alt="Payment"/>
                                                <span class="image-filename cash"><xsl:value-of select="paymentMethod"/></span>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td><xsl:value-of select="productSKU"/></td>
                                    <td><xsl:value-of select="productName"/></td>
                                    <td>$ <xsl:value-of select="productPrice"/></td>
                                    <td><xsl:value-of select="productQuantity"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
        
    </xsl:template>
</xsl:stylesheet>