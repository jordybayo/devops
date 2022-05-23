# Possible to use os.environ and replace parameter in conn command
import click
from jenkins import Jenkins


@click.command()
@click.argument("job", type=click.STRING)

def main(job):
    conn = Jenkins(username="admin", password="117b27110b43fafd4b573044196849b2ba",
            url="http://10.110.27.150:8080")
    result = conn.build_job(job)
    print(f"Triggered job {job} with build number {result}")


if __name__ == "__main__":
    main()
