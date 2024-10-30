from app import main


def test_main_output(capsys) -> None:
    # Call the main function
    main()

    # Capture the output
    captured = capsys.readouterr()

    # Assert the expected output
    assert captured.out == "hellow~\n"
