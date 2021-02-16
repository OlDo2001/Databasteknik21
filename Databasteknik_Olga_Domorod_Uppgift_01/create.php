
<div class="bottom">
  <a href="http://localhost/Databasteknik21/Databasteknik_Olga_Domorod_Uppgift_01/Admin/index.php" class="btn btn-large btn-info" target="_blank">
  Admin</a>
 </div> 
<form action="confirm.php" class="row" method="post">

<div class="col-md-6 my-2">
  <label for="name">Namn</label>
  <input type="text" id="name" class="form-control" name="name" placeholder="Ditt namn.." required> 
</div>

<div class="col-md-6 my-2">
  <label for="epost">E-post</label> 
  <input type="email" id="epost"class="form-control" name="epost" placeholder="Ditt mail.."required>
</div>

<div class="col-md-12 my-2">
  <label for="info">Meddelande</label>
  <textarea type="text" id="info" name="info" placeholder="Skriv ett meddelande..." required></textarea>
</div>

<div class="col-md-4 my-2">
  <input type="submit" value="Skicka meddelandet" class="form-control btn btn-outline-dark">

</div>
</form>


