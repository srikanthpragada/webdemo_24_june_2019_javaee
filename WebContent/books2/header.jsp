<style>
  .banner {background-color:navy;color:white;font-size:30pt;font-family:arial; font-weight:bold;}
  .menu {background-color:#dddddd;font-weight:bold;font-family:verdana;}
  .body { font-family:verdana;font-size:11pt;}
</style>

<div class="banner">Books</div>
<div class="menu">
<form action="search.jsp">
<a href="list.jsp">List Books</a>
&nbsp;
<a href="add.jsp">Add Book</a>
&nbsp;
<input type="text" name="title" placeholder="title" 
      value="${param.title}"/>
<input type="submit" value="Search" />
</form>
</div>