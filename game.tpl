

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Cryptoquote</title>
    <style>
        .letter-box .letter-radio:checked~span {
            font-weight: bold;
            color: #333;
        }

        .letter-box .letter-radio {
            display: none;
        }

        .letter-box span {
            cursor: pointer;
            font-size: 24px;
            color: #ccc;
        }

        span.small {
            font-size: 12px;
        }

        .blockquote label {
            cursor: pointer;
        }
        .letter-box {

          display: inline-block;

          }
    </style>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col text-right">
                <h1>Cryptoquote</h1>
            </div>
            <div class="col text-left align-self-center">
                <a href="/start" class="btn btn-danger">
                    New Game
                </a>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <h2>Quote</h2>
                <h3>Input</h3>
                <blockquote class="blockquote">
                    <p>
                      %for letter in quote:
                            <label for="letter-from-{{letter}}">{{letter}}</label>
                      %end
                    </p>
                </blockquote>
                <h3>Output</h3>
                <blockquote class="blockquote">
                    %for letter in quote:
                      %output = values.get(letter, letter)
                            <label for="letter-from-{{letter}}">{{output}}</label>
                    %end
                </blockquote>
            </div>
            <div class="col">
                <form method="POST">
                    <div class="row">
                        <div class="col">
                            <h2>Letters</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h3>From</h3>
                            %for key in keys:
                              <div class="radio letter-box">
                                  <label for="letter-from-{{key}}">
                                      <input type="radio" class="letter-radio" name="letterfrom" id="letter-from-{{key}}"
                                          value="{{key}}">
                                      <span>{{key}}</span>
                                  </label>
                              </div>
                            %end
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <h3>To</h3>
                            %for value in keys:
                              <div class="radio letter-box">
                                  <label for="letter-to-{{value}}">
                                      <input type="radio" class="letter-radio" name="letterto" id="letter-to-{{value}}"
                                          value="{{value}}">
                                      <span>{{value}}</span>
                                  </label>
                              </div>
                            %end
                        </div>
                    </div>
                    <div class="row">
                        
                            <div class="col">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block">
                                        Swap
                                    </button>
                                </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>

</html>