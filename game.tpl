<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/styles.css" />
    <title>Cryptoquote</title>
</head>

<body>
    <div class="container">
        <div class="row">
            <div class="col text-center">
                <h1>Cryptoquote</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-8 pb-4">
                <div class="card h-100 box-shadow">
                    <div class="card-header">
                        <div class="row">
                            <div class="col text-left">
                                <h2 class="my-0 font-weight-normal">Incoming Message</h2>
                            </div>
                            <!-- <div class="col text-right">
                                <a href="/start" class="btn btn-danger">New Game</a>
                            </div> -->
                        </div>
                    </div>
                    <div class="card-body text-center">
                        <h3 class="card-title">Input</h3>
                        <blockquote class="blockquote">
                            <p>\\
                                %for letter in quote:
&nbsp;<label for="letter-from-{{letter}}">{{letter}}</label>&nbsp;\\
                                %end
                            </p>
                        </blockquote>
                        <h3>Output</h3>
                        <blockquote class="blockquote">\\
                            %for letter in quote:
                            %output = values.get(letter, letter)
&nbsp;<label for="letter-from-{{letter}}">{{output}}</label>&nbsp;\\
                            %end
                        </blockquote>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 pb-4">
                <form method="POST" class="card h-100 box-shadow">
                    <div class="card-header">
                        <h2 class="my-0 font-weight-normal">Decoder</h2>
                    </div>
                    <div class="card-body text-center">
                        <div class="row">
                            <div class="col">
                                <h3>From</h3>
                                %for key in keys:
                                <div class="radio letter-box">
                                    <label for="letter-from-{{key}}">
                                        <input type="radio" required class="letter-radio" name="letterfrom"
                                            id="letter-from-{{key}}" value="{{key}}">
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
                                        <input type="radio" required class="letter-radio" name="letterto"
                                            id="letter-to-{{value}}" value="{{value}}">
                                        <span>{{value}}</span>
                                    </label>
                                </div>
                                %end
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <button type="submit" class="real-button btn btn-primary btn-lg btn-block">
                                    Swap
                                </button>
                                <button type="submit" disabled class="fake-button btn btn-lg btn-block">
                                    Pick two letters to swap
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>