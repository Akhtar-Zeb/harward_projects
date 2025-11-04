from fpdf import FPDF

name = input("Name: ")

pdf = FPDF(orientation="P", unit="mm", format="A4")
pdf.add_page()

pdf.set_font("Helvetica", "B", 24)
pdf.cell(0, 20, "CS50 Shirtificate", ln=True, align="C")

# A4 width is 210mm, image is 190mm wide and auto-adjusts height
pdf.image("shirtificate.png", x=10, y=60, w=190)

pdf.set_font("Helvetica", "B", 24)
pdf.set_text_color(255, 255, 255)
pdf.set_xy(0, 130)
pdf.cell(210, 10, f"{name} took CS50", align="C")

pdf.output("shirtificate.pdf")
